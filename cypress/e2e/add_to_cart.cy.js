describe("home page", () => {
  it("visits the homepage", () => {
    cy.visit("/");
  });
  it("opens the product details page when product is clicked", () => {
    cy.visit("/");
    cy.contains("Add").click();
    cy.get("a.nav-link").should("contain", "My Cart (1)");
  });
});
