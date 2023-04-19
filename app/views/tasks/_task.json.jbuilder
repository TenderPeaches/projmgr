json.extract! task, :id, :task_category_id, :project_id, :created_at, :updated_at
json.url task_url(task, format: :json)
