Given /^"([^"]*)" can ([^"]*?) ([o|i]n)?\s?the "([^"]*)" project$/ do |user, permission, on, project|
  Permission.create(:user => User.find_by_email!(user), :thing => find_project(project), :action => "create tickets")
end

def create_permission(email, object, action)
  Permission.create(:user => User.find_by_email!(email), :thing => object, :action => action)
end

def find_project(name)
  Project.find_by_name!(name)
end