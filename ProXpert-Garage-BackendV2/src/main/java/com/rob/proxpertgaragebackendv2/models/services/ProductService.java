package com.rob.proxpertgaragebackendv2.models.services;

import com.rob.proxpertgaragebackendv2.models.entities.Producto;
import com.rob.proxpertgaragebackendv2.models.repositories.ProductoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductoRepository productRepository;

    public List<Producto> findAll() {
        return productRepository.findAll();
    }

    public Producto findById(Integer id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new org.springframework.web.server.ResponseStatusException(
                        org.springframework.http.HttpStatus.NOT_FOUND, "Producto no encontrado"));
    }

    public List<Producto> findMostRecent(int quantity) {
        Pageable pageable = PageRequest.of(0, quantity);
        return productRepository.findMostRecent(pageable);
    }
}
