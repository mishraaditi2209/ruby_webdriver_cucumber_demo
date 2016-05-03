Feature: Search in motors section
  As a dubizzle user
  I search in motors section
  to buy a car

  Scenario: Search for a lowest price BMW car
    Given I am on dubizzle home page
    When I select the motors on the menu
    And I select section Used Cars for Sale
    And I select model BMW
    And I select make M3
    And I search
    And I sort result from Price Lowest to Highest
    Then I should see listings sorted from Price Lowest to Highest

  Scenario Outline: Search for a listings and sort lowest price
    Given I am on dubizzle home page
    When I select the <section> on the menu
    And I select section <category>
    And I select sub category <sub_category>
    And I select category section <category_section>
    And I search
    And I sort result from <sort_order>
    Then I should see listings sorted from <sort_order>
    Examples:
      | section | category           | sub_category | category_section | sort_order              |
#      | motors  | Used Cars for Sale | BMW   | M3   | Price Lowest to Highest |
#      | motors  | Used Cars for Sale | Audi   | A3   | Price Lowest to Highest |
      | classified  | Baby Items | Baby Gear | Chairs   | Price Lowest to Highest |
     # | Property For Rent  | Residential Units for Rent | Apartment/Flat for Rent | Chairs   | Price Lowest to Highest |

  Scenario: Search for a lowest price Apartment/Flat for Rent
    Given I am on dubizzle home page
    When I select the Property for Rent on the menu
    And I select section Residential Units for Rent
    And I select sub category Apartment/Flat for Rent
    And I search
    And I sort result from Price Lowest to Highest
    Then I should see listings sorted from Price Lowest to Highest

  Scenario Outline: Search abc for a lowest price Apartment/Flat for Rent
    Given I am on dubizzle home page
    When I select the <section> on the menu
    And I select section <category>
    And I select sub category <sub_category>
    And I search
    And I sort result from <sort_order>
    Then I should see listings sorted from <sort_order>
    Examples:
      | section           | category       |   sub_category |         sort_order              |
      | Property For Rent | Residential Units for Rent  |  Apartment/Flat for Rent  |  Price Lowest to Highest |


