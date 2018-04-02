package com.bjsxt.shopping.reports;

import java.awt.Font;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import com.bjsxt.shopping.util.DB;

/**
 * Servlet implementation class ShowProductSalesChart
 */
@WebServlet("/ShowProductSalesChart")
public class ShowProductSalesChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DefaultCategoryDataset dataset = new DefaultCategoryDataset(); 
	private DefaultPieDataset pieDataset = new DefaultPieDataset();
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public ShowProductSalesChart() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void getDataSet(DefaultCategoryDataset dataset, DefaultPieDataset pieDataset) { 
        
        Connection conn = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			
			String sql = "select p.name, sum(si.pcount) from product p join salesitem si on (p.id = si.productid) group by p.id";
			System.out.println(sql);
			
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				//dataset.addValue(100, "Beijing", "apple");  
				dataset.addValue(rs.getInt(2), "", rs.getString(1));
				pieDataset.setValue(rs.getString(1), rs.getInt(2));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
    } 
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getDataSet(dataset, pieDataset);
		  
		JFreeChart chart = ChartFactory.createBarChart3D( 
                "Product Sales Chart", // ͼ�����
                "Product Name", // Ŀ¼�����ʾ��ǩ
                "Sales Count", // ��ֵ�����ʾ��ǩ
                 dataset, // ���ݼ�
                 PlotOrientation.VERTICAL, // ͼ����ˮƽ����ֱ
                 false,  // �Ƿ���ʾͼ��(���ڼ򵥵���״ͼ������ false)
                 false, // �Ƿ����ɹ���
                 false  // �Ƿ����� URL ����
                 ); 
		
		JFreeChart pieChart = ChartFactory.createPieChart3D(
				"Product Sales Pie Chart",  // ͼ�����
		        pieDataset, 
		        true, // �Ƿ���ʾͼ��
		        false, 
		        false 
		        );
		
		
		// ���������������,��Ҫ������������
		// �����Ա���
		Font font1 = new Font("SansSerif", 10, 20); // �趨���塢���͡��ֺ�
		// Font font1 = new Font("SimSun", 10, 20); //Ҳ����
		chart.getTitle().setFont(font1); // ����
		// ������ͼ����ĺ����趨,Ҳ���ǣ�lot���趨
		Font font2 = new Font("SansSerif", 10, 16); // �趨���塢���͡��ֺ�
		CategoryPlot categoryplot = chart.getCategoryPlot();
		categoryplot.getDomainAxis().setLabelFont(font2);// �൱�ں�������ΪX��
		categoryplot.getRangeAxis().setLabelFont(font2);// �൱���������ΪY��
		// 3������ķ��������� LegendTitle ����
     
		
		FileOutputStream chart_jpg = null;
		FileOutputStream pie_jpg = null;
		
		try {
			chart_jpg = new FileOutputStream("E:\\myeclipseWorkSpace\\Shopping2\\WebRoot\\admin\\images\\reports\\productSalesCount.jpg");
			ChartUtilities.writeChartAsJPEG(chart_jpg, 1.0f, chart, 600, 600, null);
			
			pie_jpg = new FileOutputStream("E:\\myeclipseWorkSpace\\Shopping2\\WebRoot\\admin\\images\\reports\\productSalesCount_pie.jpg");
			ChartUtilities.writeChartAsJPEG(pie_jpg, 1.0f, pieChart, 600, 600, null);
			
			this.getServletContext().getRequestDispatcher("/admin/showproductsaleschart.jsp").forward(request, response);
			
		} finally {
			try {
				chart_jpg.close();
				pie_jpg.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}