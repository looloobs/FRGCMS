xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8" 
xml.Workbook({
  'xmlns'      => "urn:schemas-microsoft-com:office:spreadsheet", 
  'xmlns:o'    => "urn:schemas-microsoft-com:office:office",
  'xmlns:x'    => "urn:schemas-microsoft-com:office:excel",    
  'xmlns:html' => "http://www.w3.org/TR/REC-html40",
  'xmlns:ss'   => "urn:schemas-microsoft-com:office:spreadsheet" 
  }) do

  xml.Worksheet 'ss:Name' => 'Battalion Roster' do
    xml.Table do

      # Header
      xml.Row do
          xml.Cell { xml.Data 'First Name', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Last Name', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Street Number & Name', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'City', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'State', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Zip', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Email1', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Email2', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Priority 1 Phone', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'SMS Priority 1', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Priority 2 Phone', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Phone 2 SMS', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Phone 2 Extension', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Phone 3 Phone', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Phone 3 SMS', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Pager (alpha numeric)', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Birthdate ', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Local_id ', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'SponsorLocalID ', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Rank ', 'ss:Type' => 'String'} 
          xml.Cell { xml.Data 'Group ', 'ss:Type' => 'String'}
          xml.Cell { xml.Data 'Group ', 'ss:Type' => 'String'}
          xml.Cell { xml.Data 'Admin ', 'ss:Type' => 'String'}
          xml.Cell { xml.Data 'Admin ', 'ss:Type' => 'String'}
          xml.Cell { xml.Data 'User Type ', 'ss:Type' => 'String'}
          xml.Cell { xml.Data 'Gender ', 'ss:Type' => 'String'}
      end

      # Rows
      for soldier in @joes
        xml.Row do
            xml.Cell { xml.Data soldier.firstname, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.lastname, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.address, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.city, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.state, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.zip, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.email, 'ss:Type' => 'String' }
            xml.Cell {  }
            xml.Cell { xml.Data soldier.cellphone, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.sms, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.addphone, 'ss:Type' => 'String' }
            xml.Cell {  }
            xml.Cell {  }
            xml.Cell {  }
            xml.Cell {  }
            xml.Cell {  }
            xml.Cell { xml.Data soldier.birth_date, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.id, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.id, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.rank, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.battalion.unit, 'ss:Type' => 'String' }
            xml.Cell { xml.Data soldier.company.name, 'ss:Type' => 'String' }
        end
      end

    end
  end
end