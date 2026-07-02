import pandas as pd
import numpy as np

def compute_sharpe(returns):
    """
    Compute annualized Sharpe ratios from daily returns.
    returns: DataFrame with amfi_code columns and daily returns
    """
    sharpe_ratios = (returns.mean() / returns.std()) * np.sqrt(252)
    sharpe_df = sharpe_ratios.reset_index()
    sharpe_df.columns = ['amfi_code','sharpe_ratio']
    return sharpe_df

def build_fund_metrics(sharpe_df, fund_master_path):
    """
    Merge Sharpe ratios with fund master metadata.
    """
    fund_master = pd.read_csv(fund_master_path)
    fund_metrics = sharpe_df.merge(
        fund_master[['amfi_code','scheme_name','risk_category']],
        on='amfi_code',
        how='left'
    )
    return fund_metrics

def recommend_funds(fund_metrics, risk_appetite, top_n=3):
    """
    Recommend top funds based on Sharpe ratio for a given risk appetite.
    """
    subset = fund_metrics[fund_metrics['risk_category'] == risk_appetite]
    top_funds = subset.sort_values('sharpe_ratio', ascending=False).head(top_n)
    return top_funds[['scheme_name','amfi_code','sharpe_ratio']]

# Example usage (if run directly):
if __name__ == "__main__":
    # Load daily returns (replace with your actual returns DataFrame)
    # returns = pd.read_csv("daily_returns.csv", index_col=0)
    # sharpe_df = compute_sharpe(returns)
    # fund_metrics = build_fund_metrics(sharpe_df, "C:/23321A0533/bluestock/data/raw/01_fund_master.csv")
    # print(recommend_funds(fund_metrics, "Moderate"))
    pass
