package productcrudapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import productcrudapp.DAO.ProductDAO;
import productcrudapp.model.Product;

@Controller
public class MainController {
	
	@Autowired
	/*
	 * Spring will create the object of productDAO and inject the same in
	 * MainController
	 */
	private ProductDAO productDAO;
	
	@RequestMapping("/")
	public String home(Model model)
	{
		List<Product> products = productDAO.getProducts();
		model.addAttribute("title","Product CRUD App");
		model.addAttribute("products", products);
		return "index";
	}
	
	/* For adding the product */
	@RequestMapping("/add-product")
	public String addProduct(Model model)
	{
		model.addAttribute("title","Add Product");
		return "add_product_form";
	}
	
	/* For handling the product */
	@RequestMapping(value="/handle-product", method = RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product product, HttpServletRequest request)
	{
		System.out.println(product);
		productDAO.createProduct(product);
		/*
		 * The above line of code will take the productDAO variable from MainController
		 * which is Auto-wired with ProductDAO so the object of the same will be created
		 * in MainController hence we can use it's function. Hereby, we are using
		 * createProduct function of productDAO in order to save the data in database.
		 */
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
	/* For deleting the product */
	@RequestMapping("/delete-product/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int productId,HttpServletRequest request)
	{
		productDAO.deleteProduct(productId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
	/* For updating the product */
	/* Template URI variable */
	@RequestMapping("/update-product/{productId}")
	public String updateForm(@PathVariable("productId") int productId, Model model)
	{
		model.addAttribute("title","Update Product");
		Product product = productDAO.getProduct(productId);
		model.addAttribute("product",product);
		return "update_form";
	}

}
