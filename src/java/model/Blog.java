package model;

import java.sql.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author ASUS
 */

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Blog {
    
    private int id;
    private String title;
    private String description;
    private String content;
    private String coverImgPath;
    private String mainImgPath;
    private Date createdDate;
    private int cateId;
    private Account account;
    private List<Tags> tags;
    private List<Comment> comment;
    
}
