package lk.ijse.ecommercewebapplicationjavaee.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class User {
    private String userName;
    private String email;
    private String role;
    private String password;
    private boolean status;
}
