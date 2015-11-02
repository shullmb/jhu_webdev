require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(params)
      User.create(username: params[:username], password_digest: params[:password_digest])
  end

  def create_todolist(params)
      TodoList.create(list_name: params[:name], list_due_date: params[:due_date])
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
      User.all.offset(offset).limit(limit)
  end

  def find_alllists(offset, limit)
      TodoList.all.offset(offset).limit(limit).order(list_due_date: :desc)
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
      User.where(username: username)
  end 

  def find_todolist_byname(name)
      TodoList.where(list_name: name)
  end     

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
      User.find_by_id(id)
  end

  def get_todolist_byid(id)
      TodoList.find_by_id(id)
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
      get_user_byid(id).update(password_digest: password_digest)
  end

  def update_listname(id, name)
      get_todolist_byid(id).update(list_name: name)
  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
      get_user_byid(id).delete
  end 

  def delete_todolist(id)
      get_todolist_byid(id).delete
  end
end
