package data;

public class CoviData {
	private String addr;
	private int addrcount;
	public CoviData() {
		super();
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getAddrcount() {
		return addrcount;
	}
	public void setAddrcount(int addrcount) {
		this.addrcount = addrcount;
	}
	@Override
	public String toString() {
		return "[" + addr + "," + addrcount + "]";
	}
	
	
}
