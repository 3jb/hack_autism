class GoogleSpreadsheet
  class << self
    def worksheet title
      worksheet = session.spreadsheet_by_title(title).worksheets.first
    end
  
    def session
      @session ||= GoogleDrive.login("hackautism@gmail.com", "hackautism1")
    end
    
    def quest_1
      ws = GoogleSpreadsheet.worksheet("quest1-script")
    end
  end
end