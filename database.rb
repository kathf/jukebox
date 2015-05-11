class Database
  def self.connection(dbopts = {})
    @@conn ||= PG.connect(dbopts)
  end
end
