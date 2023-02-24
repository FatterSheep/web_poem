package cc.openhome.model;

public interface AccountDAO {
	boolean isUserExist(Account account);
	void addAccount(Account account);
	Account getAccount(Account account);
}

