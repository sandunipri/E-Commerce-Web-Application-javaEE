package lk.ijse.ecommercewebapplicationjavaee.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryCard {
    private String categoryName;
    private String categoryImage;
    private String categoryDescription;
}
