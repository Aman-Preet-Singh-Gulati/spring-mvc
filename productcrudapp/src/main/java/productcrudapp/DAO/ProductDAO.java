package productcrudapp.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import productcrudapp.model.Product;

@Component
/* So that spring will handle the life-cycle of this class as an Component */
public class ProductDAO {
	
	@Autowired
	/*
	 * So that we can tell Spring to auto-configure the object that it will create
	 * from spring-servlet.xml file and configure in the below hibernateTemplate
	 * object
	 */
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	/* To enable the Transactional feature into the database */
	/* Create a product */
	public void createProduct(Product product)
	{
		this.hibernateTemplate.saveOrUpdate(product);
		/*
		 * save: will act only when new Id is encountered.
		 * update: will act when the existing Id is encountered.
		 */
	}
	
	/* Retrieve all the products */
	public List<Product> getProducts()
	{
		List<Product> products = this.hibernateTemplate.loadAll(Product.class);
		return products;
	}
	
	/* Delete the single product */
	@Transactional
	public void deleteProduct(int pid)
	{
		/*
		 * First we have fetched(load) a complete product (p) of a specific id that
		 * needs to be deleted then, deleted the same using 'delete'
		 */
		Product p = this.hibernateTemplate.load(Product.class, pid);
		this.hibernateTemplate.delete(p);
		
	}
	
	/* Retrieve the single product */
	public Product getProduct(int pid)
	{
		return this.hibernateTemplate.get(Product.class, pid);
	}
}
