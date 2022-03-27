package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
// 위의 어노테이션 @는 lombok 라이브러리를 이용해서 자동으로 필요한 코드를 생성해줍니다.

// 외부평가때는 롬복 사용 불가
public class HrdMember {
	private int custNo;
	private String custName;
	private String phone;
	private String addr;
	private Date joinDate;
	private String grade;
	private String city; 
}

