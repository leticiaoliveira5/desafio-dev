class PersistDataService
  def initialize(data:, user:)
    @data = data
    @user = user
  end

  def call
    return false unless @data

    cnab_file = CnabFile.create(user: @user)

    @data.each do |t|
      store = Store.find_or_create_by(owner: t[:store][:owner],
                                      name: t[:store][:name],
                                      cnab_file: cnab_file)
      Transaction.create(t.except!(:store).merge({ store_id: store.id }))
    end

    cnab_file
  end
end
