namespace :parse do

  task deputies: :environment do
    if Deputy.all.length < 1
      Uf.populate_ufs
      Party.parse_parties
      Deputy.parse_deputies
    else
      puts "Base de deputados já populado!"
    end
  end

  task parties: :environment do
    Party.parse_parties
  end

  task quests: :environment do
    Quest.parse_quests
  end

  task levels: :environment do
    Level.parse_levels
  end

  task expenses: :environment do
      ExpenseType.parse_expenses
  end

  task images: :environment do
    Deputy.parse_download_image_webservice
  end
end
