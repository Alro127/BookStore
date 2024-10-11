package servlets;
import beans.bookBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class servlet_AddToCart
 */
public class servlet_Books extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public servlet_Books() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		List<bookBean> cart = (List<bookBean>) session.getAttribute("cart");
		List<bookBean> books = (List<bookBean>) session.getAttribute("books");

		String bookId = request.getParameter("bookId");
		boolean found = false;
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Kiểm tra xem sách đã có trong giỏ hàng chưa
        for (bookBean book : cart) {
            if (book.getId().equals(bookId)) {
                book.increase(); // Tăng số lượng nếu đã có
                found = true;
                break;
            }
        }

        // Nếu chưa có trong giỏ hàng, tìm sách từ danh sách sách
        if (!found) {
            for (bookBean book : books) {
                if (book.getId().equals(bookId)) {
                    cart.add(book); // Thêm sách vào giỏ hàng
                    break;
                }
            }
        }
        float total = 0;
        for (bookBean book : cart) {
            total += book.getPrice()*book.getQuantity();
        }
        session.setAttribute("cart", cart);
        request.setAttribute("total", total);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
        
	}

}
