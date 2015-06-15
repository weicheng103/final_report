class MembernosController < ApplicationController
	def index
		if params[:year].present?  
			y = params[:year]
		else
			y = 0
		end
		query = "SELECT 
			count(agn.Agent_No) as C_count
			FROM final_report.b01b1_memberno as mem,final_report.a05b00_order as ord,final_report.a04a1_agentno as agn 
			left join final_report.a04a1_agentno as sub on sub.Host_No = agn.Agent_No  
			where mem.Cancel_Mark = 0 and sub.Agent_No = mem.Agent_No and ord.Member_No = mem.Member_No 
			and year(ord.Input_Date) = ?
			group by mem.Member_No
			Order by count(agn.Agent_No)",y
		@data = Memberno.find_by_sql(query)
		query = "SELECT distinct
			count(agn.Agent_No) as C_count
			FROM final_report.b01b1_memberno as mem,final_report.a05b00_order as ord,final_report.a04a1_agentno as agn 
			left join final_report.a04a1_agentno as sub on sub.Host_No = agn.Agent_No  
			where mem.Cancel_Mark = 0 and sub.Agent_No = mem.Agent_No and ord.Member_No = mem.Member_No  
			and ord.Agent_No = ifnull(sub.Agent_No,agn.Agent_No)
			and year(ord.Input_Date) = ?
			group by mem.Member_No
			Order by count(agn.Agent_No)",y
		@Title = Memberno.find_by_sql(query)
		query = "SELECT 
			month(ord.Input_Date) as m_count 
			FROM final_report.b01b1_memberno as mem,final_report.a05b00_order as ord,final_report.a04a1_agentno as agn 
			left join final_report.a04a1_agentno as sub on sub.Host_No = agn.Agent_No  
			where mem.Cancel_Mark = 0 and sub.Agent_No = mem.Agent_No and ord.Member_No = mem.Member_No 
			and year(ord.Input_Date) = ?
			group by mem.Member_No,month(ord.Input_Date)
			Having count(agn.Agent_No)  <> 1
			order by month(ord.Input_Date),count(agn.Agent_No)",y
		@ndata = Memberno.find_by_sql(query)
		query = "SELECT  distinct 
			year(ord.Input_Date) as m_count
			FROM final_report.b01b1_memberno as mem,final_report.a05b00_order as ord,final_report.a04a1_agentno as agn 
			left join final_report.a04a1_agentno as sub on sub.Host_No = agn.Agent_No  
			where mem.Cancel_Mark = 0 and sub.Agent_No = mem.Agent_No and ord.Member_No = mem.Member_No 
			group by mem.Member_No,month(ord.Input_Date)
			order by year(ord.Input_Date),count(agn.Agent_No)"
		@search = Memberno.find_by_sql(query)
		y = y.to_i-1
		query = "SELECT 
			month(ord.Input_Date) as m_count
			FROM final_report.b01b1_memberno as mem,final_report.a05b00_order as ord,final_report.a04a1_agentno as agn 
			left join final_report.a04a1_agentno as sub on sub.Host_No = agn.Agent_No  
			where mem.Cancel_Mark = 0 and sub.Agent_No = mem.Agent_No and ord.Member_No = mem.Member_No 
			and year(ord.Input_Date) = ?
			group by mem.Member_No,month(ord.Input_Date)
			Having count(agn.Agent_No) <> 1
			order by month(ord.Input_Date),count(agn.Agent_No)",y
		@fdata = Memberno.find_by_sql(query)
		y = y.to_i-1
		query = "SELECT 
			month(ord.Input_Date) as m_count
			FROM final_report.b01b1_memberno as mem,final_report.a05b00_order as ord,final_report.a04a1_agentno as agn 
			left join final_report.a04a1_agentno as sub on sub.Host_No = agn.Agent_No  
			where mem.Cancel_Mark = 0 and sub.Agent_No = mem.Agent_No and ord.Member_No = mem.Member_No 
			and year(ord.Input_Date) = ?
			group by mem.Member_No,month(ord.Input_Date)
			Having count(agn.Agent_No) <> 1
			order by month(ord.Input_Date),count(agn.Agent_No)",y		
		@ftdata = Memberno.find_by_sql(query)

	end
end
