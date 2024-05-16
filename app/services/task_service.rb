class TaskService
    def self.create(params)
        debugger
      Task.create(params)
    end
  
    def self.update(task, params)
      task.update(params)
    end
  
    def self.destroy(task)
      task.destroy
    end
end