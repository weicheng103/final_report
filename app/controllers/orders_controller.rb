class OrdersController < ApplicationController
	def index
		query = "SELECT year(Input_Date) as yer, month(Input_Date) as mon, count(Order_No)  as sum
			FROM final_report.a05b00_order
			where year(Input_Date) between 2006 and 2013
			group by year(Input_Date),month(Input_Date);"
		@data = Order.find_by_sql(query)
	end
end
