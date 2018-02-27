class CreateStatusTypesList < ActiveRecord::Migration[5.1]
  StatusType.create(id: 1, name: 'En attente')
  StatusType.create(id: 2, name: 'accepté')
  StatusType.create(id: 3, name: 'refusé')
  StatusType.create(id: 4, name: 'annulé')
end
