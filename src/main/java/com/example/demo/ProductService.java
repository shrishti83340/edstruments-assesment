package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private ProductRepository repo;

    public List<Product> getAllProducts() {
        return repo.findAll();
    }

    public Product getProductById(Long id) {
        return repo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product with ID " + id + " not found"));
    }

    public Product createProduct(Product product) {
        return repo.save(product);
    }

    public Product updateProduct(Long id, Product newProduct) {
        return repo.findById(id).map(product -> {
            product.setName(newProduct.getName());
            product.setDescription(newProduct.getDescription());
            product.setPrice(newProduct.getPrice());
            return repo.save(product);
        }).orElseThrow(() -> new ResourceNotFoundException("Product with ID " + id + " not found"));
    }

    public void deleteProduct(Long id) {
        repo.deleteById(id);
    }
}
