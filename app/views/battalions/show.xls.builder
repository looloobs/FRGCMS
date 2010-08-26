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
          xml.Cell { xml.Data 'Rank', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'First Name', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Last Name', 'ss:Type' => 'String' }
      end

      # Rows
      for order in @joes
        xml.Row do
            xml.Cell { xml.Data joes.rank, 'ss:Type' => 'String' }
            xml.Cell { xml.Data order.lastname, 'ss:Type' => 'String' }
            xml.Cell { xml.Data order.firstname, 'ss:Type' => 'String' }
        end
      end

    end
  end
end

