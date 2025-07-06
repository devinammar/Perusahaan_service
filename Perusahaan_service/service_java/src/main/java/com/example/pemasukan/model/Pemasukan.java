package com.example.pemasukan.model;

import javax.persistence.*;

@Entity
@Table(name = "pendapatan_2023")
public class Pemasukan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String sumber;
    private Double jumlah;

    // Getter dan Setter
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getSumber() { return sumber; }
    public void setSumber(String sumber) { this.sumber = sumber; }

    public Double getJumlah() { return jumlah; }
    public void setJumlah(Double jumlah) { this.jumlah = jumlah; }
}
