Feature: Search in Property for rent section
  As a dubizzle user
  I search in Residential units for rent in Property for rent section
  to get a apartment/flat for rent

  Scenario: Search for a lowest apartment/flat for rent
    Given I am on dubizzle home page
    When I select the property for rent on the menu
    And I select Residential units for rent
    And I select apartment/flat for rent
    And I search
    And I sort result from lowest to highest price
    Then I should see listings sorted from lowest to highest price

