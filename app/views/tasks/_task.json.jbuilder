json.extract! task, :id, :project_id, :task_category_id, :created_at, :updated_at
json.url task_url(task, format: :json)
