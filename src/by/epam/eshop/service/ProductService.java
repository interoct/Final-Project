package by.epam.eshop.service;

import by.epam.eshop.entity.Product;
import by.epam.eshop.service.exception.ServiceException;

import java.util.List;

public interface ProductService {
    boolean addProduct(Product product) throws ServiceException;

    List<Product> getAll() throws ServiceException;

    boolean updateProduct(Product product) throws ServiceException;

    boolean removeProduct(Product product) throws ServiceException;
}