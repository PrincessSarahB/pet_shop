def pet_shop_name(pet_shop)

  return pet_shop[:name]

end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]

end

def add_or_remove_cash(pet_shop, num)

  pet_shop[:admin][:total_cash] += num

end

def pets_sold(pet_shop)

  return pet_shop[:admin][:pets_sold]

end

def increase_pets_sold(pet_shop, num)

  pet_shop[:admin][:pets_sold] += num

end

def stock_count(pet_shop)
  pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets.push(pet_shop)
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if name == pet[:name]
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if name == pet[:name]
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customers)
  customers[:pets].count
end

def add_pet_to_customer(customers, new_pet)
  customers[:pets].push(new_pet)
end

def customer_can_afford_pet(customers, pet_shop)
  if customers[:cash] >= pet_shop[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, new_pet, customer)

  if new_pet && pet_shop && customer

    if customer_can_afford_pet(customer, new_pet)
      add_pet_to_customer(customer, new_pet)
      increase_pets_sold(pet_shop, 1)
      add_or_remove_cash(pet_shop, new_pet[:price])

      return true
    else
      return false
    end
  else
    return false
  end
end
