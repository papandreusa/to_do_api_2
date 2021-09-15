module Api::V1::Constants::Task
  POSITION_MIN = 1
  ORDERS = { 'created_desc' => 'tasks.created_at desc',
             'created_asc' => 'tasks.created_at',
             'name_asc' => 'tasks.name',
             'name_desc' => 'tasks.name desc',
             'due_date' => 'due_date',
             'position' => 'position' }
  ORDER_DEFAULT = 'tasks.created_at desc'
end
