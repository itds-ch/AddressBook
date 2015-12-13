package addressbook

class SecurityFilters {

    def filters = {
		
		loginCheck(controller: '(benutzer|addressBook|tag|person|address|auth)', action: '*') {
			before = {
				if (!session.userId
					&& !actionName.equals('login')
					&& !actionName.equals('authenticate')) {
					redirect(controller: "auth", action: "login")
					return false
				}
			}
		}
      
		
    }
}
