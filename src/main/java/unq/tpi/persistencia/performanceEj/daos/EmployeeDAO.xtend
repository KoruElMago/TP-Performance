package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Employee
import unq.tpi.persistencia.util.SessionManager

class EmployeeDAO {

	def getByName(String name, String lastName) {
		val session = SessionManager.getSession()
		session.createQuery("from Employee emp where emp.firstName = :name and emp.lastName = :lastName")
				.setParameter("name", name)
				.setParameter("lastName", lastName)
				.uniqueResult() as Employee
	}

	def getAll() {
		val session = SessionManager.getSession()
		//own
		//session.createCriteria(Employee).list() as List<Employee>
		session.createQuery("from Employee").list as List<Employee>
	}

	def getByCode(int id) {
		val session = SessionManager.getSession()
		session.load(Employee, id) as Employee
	}
	
	def getNameAndSalary(){
	val session = SessionManager.getSession()
		val query = session.createQuery("select salary.employee from Salary as salary order by salary.amount")
		query.maxResults = 10
		query.list as List<Employee>
	}

}
