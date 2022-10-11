class Parser
  def initialize(file:, current_user:)
    @file = file
    @current_user = current_user
  end

  def call
    File.read(@file.tempfile).each_line do |line|
      t = Transaction.new
      s = Store.find_or_create_by(owner: line[48..61], name: line[62..81], user: @current_user)
  
      t.type = line[0].to_i
      year = line[1..4].to_i
      month = line[5..6].to_i
      day = line[7..8].to_i
      hour = line[42..43].to_i
      minute = line[44..45].to_i
      second = line[46..47].to_i
      t.sold_at = DateTime.new(year,month,day,hour,minute,second)
      t.amount = line[9..18]
      t.document = line[19..29]
      t.card = line[30..41]
      t.store_id = s.id
  
      t.save!
    end
  end
end