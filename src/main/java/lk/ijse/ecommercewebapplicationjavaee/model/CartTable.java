package lk.ijse.ecommercewebapplicationjavaee.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class CartTable {
    private String productName;
    private double productPrice;
    private int qty;
    private double total;
}
