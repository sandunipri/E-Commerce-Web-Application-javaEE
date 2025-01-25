package lk.ijse.ecommercewebapplicationjavaee.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderTable {
    private int orderId;
    private String userEmail;
    private String productName;
    private int qty;
    private double total;
}

