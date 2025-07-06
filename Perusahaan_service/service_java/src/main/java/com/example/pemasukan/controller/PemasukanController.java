package com.example.pemasukan.controller;

import com.example.pemasukan.model.Pemasukan;
import com.example.pemasukan.repository.PemasukanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pendapatan_2023")
public class PemasukanController {

    @Autowired
    private PemasukanRepository repository;

    @GetMapping
    public List<Pemasukan> getAll() {
        return repository.findAll();
    }

    @PostMapping
    public Pemasukan create(@RequestBody Pemasukan pemasukan) {
        return repository.save(pemasukan);
    }

    @PutMapping("/{id}")
    public Pemasukan update(@PathVariable Long id, @RequestBody Pemasukan data) {
        Pemasukan p = repository.findById(id).orElseThrow();
        p.setSumber(data.getSumber());
        p.setJumlah(data.getJumlah());
        return repository.save(p);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        repository.deleteById(id);
    }
}
