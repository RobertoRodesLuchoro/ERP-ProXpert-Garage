package com.rob.proxpertgaragebackendv2.controllers;

import com.rob.proxpertgaragebackendv2.models.entities.Producto;
import com.rob.proxpertgaragebackendv2.models.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/productos")
@RequiredArgsConstructor
public class ProductoController {

    private final ProductService productService;

    @GetMapping
    public List<Producto> getAll() {
        return productService.findAll();
    }

    @GetMapping("/{id}")
    public Producto getById(@PathVariable Integer id) {
        return productService.findById(id);
    }

    @GetMapping("/recientes")
    public List<Producto> getMostRecent(@RequestParam(defaultValue = "5") int cantidad) {
        return productService.findMostRecent(cantidad);
    }
}

