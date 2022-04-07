package database;

import java.util.List;

public class Page {
private int now;
private int next;
private int pre;
private int item;
private int sum;
private int size=10;
private int index;
private List list;
private int sPage;
private int ePage;
public Page(int now,int item)
{
	this.now=now;
	this.item=item;
	index=(now-1)*size;//计算开始索引 calc start item
	sum=(item%size==0)?(item/size):(item/size+1);//计算总页数 calc sum page
	sPage=now-4;
	ePage=now+4;
	if(sum>9)
	{
		if(sPage<1)
		{
			sPage=1;
			ePage=sPage+8;
		}
		if(ePage>sum)
		{
			ePage=sum;
			sPage=sum-8;
		}
	}else
	{
		sPage=1;
		ePage=sum;
	}
}
public int getNow() {
	return now;
}
public void setNow(int now) {
	this.now = now;
}
public int getNext() {
	next=now+1;
	if(next>sum)
		next=sum;
	return next;
}
public int getPre() {
	pre=now-1;
	if(pre<1)
		pre=1;
	return pre;
}
public int getItem() {
	return item;
}
public void setItem(int item) {
	this.item = item;
}
public int getSum() {
	return sum;
}
public void setSum(int sum) {
	this.sum = sum;
}
public int getSize() {
	return size;
}
public void setSize(int size) {
	this.size = size;
}
public int getIndex() {
	return index;
}
public void setIndex(int index) {
	this.index = index;
}
public List getList() {
	return list;
}
public void setList(List list) {
	this.list = list;
}
public int getsPage() {
	return sPage;
}
public void setsPage(int sPage) {
	this.sPage = sPage;
}
public int getePage() {
	return ePage;
}
public void setePage(int ePage) {
	this.ePage = ePage;
}
public void setNext(int next) {
	this.next = next;
}
public void setPre(int pre) {
	this.pre = pre;
}

}
