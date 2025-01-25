package lk.ijse.ecommercewebapplicationjavaee.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class UserTable {
    private String userName;
    private  String userEmail;
    private String userRole;
//    private Boolean status;
}
