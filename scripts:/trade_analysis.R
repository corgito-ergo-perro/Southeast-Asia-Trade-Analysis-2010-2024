install.packages(c("readxl", "tidyverse"))
install.packages("writexl")

library(readxl)
library(tidyverse)
library(writexl)


# Read Excel
trade_data <- read_excel("TRADE.xlsx", sheet = "Data")

# Make sure column names are clean
colnames(trade_data)

asean6 <- c("Malaysia", "Philippines", "Viet Nam", "Thailand", "Indonesia", "Singapore")

trade6 <- trade_data %>%
  filter(COUNTRY %in% asean6)

# Create images folder if it doesn't exist
dir.create("images", showWarnings = FALSE)

# Line chart: Trade Balance (% of GDP) 2005–2024
trade_balance_plot <- trade6 %>%
  ggplot(aes(x = YEAR, y = TRADE, color = COUNTRY)) +
  geom_line(linewidth = 1) +
  labs(
    title = "Trade Balance (% of GDP) — ASEAN6 (2005–2024)",
    x = NULL,
    y = "Trade Balance (% of GDP)",
    color = "Country"
  ) +
  theme_minimal()

ggsave("images/asean6_trade_balance.png", trade_balance_plot, width = 8, height = 5, dpi = 300)





exp_imp_plot <- trade6 %>%
  pivot_longer(cols = c(EXPORT, IMPORT),
               names_to = "indicator", values_to = "value") %>%
  mutate(indicator = recode(indicator,
                            EXPORT = "Exports (% of GDP)",
                            IMPORT = "Imports (% of GDP)")) %>%
  ggplot(aes(x = YEAR, y = value, color = indicator)) +
  geom_line(linewidth = 1) +
  facet_wrap(~ COUNTRY, scales = "free_y") +
  labs(
    title = "Exports vs Imports (% of GDP) — ASEAN6 (2005–2024)",
    x = NULL, y = "% of GDP", color = ""
  ) +
  theme_minimal()

ggsave("images/asean6_exports_imports.png", exp_imp_plot, width = 10, height = 6, dpi = 300)




avg_trade <- trade6 %>%
  group_by(COUNTRY) %>%
  summarise(avg_trade_balance = mean(TRADE, na.rm = TRUE))

avg_trade_plot <- avg_trade %>%
  ggplot(aes(x = reorder(COUNTRY, avg_trade_balance), y = avg_trade_balance)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Average Trade Balance (% of GDP), 2005–2024",
    x = NULL,
    y = "Average Trade Balance (% of GDP)"
  ) +
  theme_minimal()

ggsave("images/asean6_avg_trade_balance.png", avg_trade_plot, width = 7, height = 4, dpi = 300)


summary_table <- trade6 %>%
  group_by(COUNTRY) %>%
  summarise(
    best_year = YEAR[which.max(TRADE)],
    best_value = max(TRADE, na.rm = TRUE),
    worst_year = YEAR[which.min(TRADE)],
    worst_value = min(TRADE, na.rm = TRUE)
  ) %>%
  arrange(desc(best_value))

summary_table



summary_table <- trade6 %>%
  group_by(COUNTRY) %>%
  summarise(
    best_year  = YEAR[which.max(TRADE)],
    best_value = max(TRADE, na.rm = TRUE),
    worst_year  = YEAR[which.min(TRADE)],
    worst_value = min(TRADE, na.rm = TRUE)
  ) %>%
  arrange(desc(best_value)) %>%
  mutate(
    best_value  = round(best_value, 2),
    worst_value = round(worst_value, 2)
  )


# Make sure folder exists
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

write_xlsx(summary_table, "data/processed/asean6_trade_summary.xlsx")




top_movers <- trade6 %>%
  filter(YEAR %in% c(2005, 2024)) %>%
  select(COUNTRY, YEAR, EXPORT, IMPORT) %>%
  pivot_wider(names_from = YEAR, values_from = c(EXPORT, IMPORT),
              names_sep = "_") %>%
  mutate(
    change_exports = EXPORT_2024 - EXPORT_2005,
    change_imports = IMPORT_2024 - IMPORT_2005
  ) %>%
  arrange(desc(change_exports))

top_movers

write_xlsx(top_movers, "data/processed/asean6_top_movers.xlsx")

top_movers_plot <- top_movers %>%
  ggplot(aes(x = reorder(COUNTRY, change_exports), y = change_exports)) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(
    title = "Change in Exports (% of GDP), 2005–2024",
    x = NULL,
    y = "Change (% of GDP)"
  ) +
  theme_minimal()

ggsave("images/asean6_top_movers_exports.png", top_movers_plot, width = 7, height = 4, dpi = 300)




# Reshape for combined bar chart
top_movers_long <- top_movers %>%
  select(COUNTRY, change_exports, change_imports) %>%
  pivot_longer(cols = c(change_exports, change_imports),
               names_to = "indicator", values_to = "change") %>%
  mutate(indicator = recode(indicator,
                            change_exports = "Exports",
                            change_imports = "Imports"))

# Plot
top_movers_combined_plot <- top_movers_long %>%
  ggplot(aes(x = reorder(COUNTRY, change), y = change, fill = indicator)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(
    title = "Change in Exports and Imports (% of GDP), 2005–2024",
    x = NULL,
    y = "Change (% of GDP)",
    fill = ""
  ) +
  theme_minimal()

# Save
ggsave("images/asean6_top_movers_combined.png", top_movers_combined_plot,
       width = 8, height = 5, dpi = 300)
