package cn.edu.gdpu.dao;

public class PageController {

	private int pageSize = 6; 	// 每个页面所显示的记录数
	private int pageCount; 		// 一共有多少个页面
	private int showPage; 		// 目前显示第几页，当前页码
	private int recordCount; 	// 总记录数
	private int position; 		// 游标
	private int nextPage;		//下一页
	private int previousPage;	//上一页
	private boolean hasNext;	//是否有下一页
	private boolean hasPrevious;//是否有上一页
	
	public PageController() {
		
	}
	
	
	/**
	 * PageController
	 * 构造函数
	 * @param recordCount 总记录数
	 * @param showPage	当前页码
	 */
	public PageController(int recordCount, int showPage) {
		setPageController(recordCount, showPage);
	}
	
	
	public void setPageController(int recordCount, int showPage) {
		setRecordCount(recordCount);
		setShowPage(showPage);
	}
	
	//设置总行数
	public void setRecordCount(int recordCount) {
		if(recordCount<0){
			this.recordCount = 0;
		}else{
			this.recordCount = recordCount;
		}
		setPageCount(this.recordCount);
	}
	
	//设置总页数
	public void setPageCount(int recordCount) {
		if(recordCount%pageSize==0){
			this.pageCount = recordCount / pageSize;
		}else{
			this.pageCount = recordCount / pageSize + 1;
		}
	}

	//设置当前页
	public void setShowPage(int showPage) {
		
		if(showPage < 0){
			this.showPage = 1;
		}else if(showPage > this.recordCount){
			this.showPage = recordCount;
		}else{
			this.showPage = showPage;
		}
		
	    //计算是否有上一页,是否有下一页
	    if(showPage <= 1){
	      hasPrevious = false;
	    }else{
	      hasPrevious = true;
	    }

	    if(showPage >= this.pageCount){
	      hasNext = false;
	    }else{
	      hasNext = true;
	    }

	    //计算上一页和下一页
	    if(hasNext==true){
	    	setNextPage(showPage + 1);
	    }else{
	    	setNextPage(showPage);
	    }
	    
	    if(hasPrevious==true){
	    	setPreviousPage(showPage - 1);
	    }else{
	    	setPreviousPage(showPage);
	    }
	    
	    //设置游标
	    setPosition(showPage);
	}

	//设置游标，指定列表
	public void setPosition(int position) {
	    this.position = (showPage - 1)*pageSize;
	}

	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	
	public void setHasPrevious(boolean hasPrevious) {
		this.hasPrevious = hasPrevious;
	}
	
	public int getPreviousPage() {
		return previousPage;
	}
	
	public int getNextPage() {
		return nextPage;
	}


	public int getPosition() {
		return position;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public boolean isHasNext() {
		return hasNext;
	}


	public boolean isHasPrevious() {
		return hasPrevious;
	}

	public int getPageCount() {
		return pageCount;
	}


	public int getShowPage() {
		return showPage;
	}


	public int getRecordCount() {
		return recordCount;
	}



}
