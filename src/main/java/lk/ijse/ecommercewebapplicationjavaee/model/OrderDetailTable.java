package lk.ijse.ecommercewebapplicationjavaee.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderDetailTable {
    private String userEmail;
    private double subTotal;
}
