ActiveAdmin.register RakeTask do
  menu parent: "Параметры сайта", priority: 2
  
  form do |f|
    f.inputs "Настройка задачи" do
      f.input :name
      f.input :task
      f.input :status
    end
    f.actions
  end
  
  show do |b|
      attributes_table do
        row :name
        row :task
        row :shedule do |s|
          shedule = IceCube::Schedule.from_hash(s)
          shedule.to_s
        end
        row :status do |s|
          s ? "Выполняется" : "Отключена"
        end
      end
  end
  
  controller do
    def create
      schedule = IceCube::Schedule.new(Time.now)
      schedule.add_recurrence_rule IceCube::Rule.minutely(5)
      @rake_task = RakeTask.new(params[:rake_task])
      @rake_task.shedule = schedule.to_hash
      super
    end
  end
end
