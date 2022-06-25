package utilities;

import com.github.javafaker.Faker;

public class commonutils {
	
	public String generateRandomString() {
		Faker faker = new Faker();
		String fn = faker.name().firstName();
		String ln = faker.name().lastName();
		String rn = faker.number().digits(3);
		return fn+"."+ln+rn;
	}

}
