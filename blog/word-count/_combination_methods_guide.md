# Guide to Combining Distinctiveness Metrics

## Understanding the Three Metrics

1. **count_distinct**: Based on raw word frequency (words per million)
   - Best for: Overall prominence in the discourse
   - Sensitive to: Repeated use in individual articles

2. **appear_distinct**: Based on document dispersion (proportion of articles)
   - Best for: Breadth of usage across the journal
   - Sensitive to: Widely used terms vs. niche terms

3. **topic_distinct**: Based on concentrated usage (articles with 10+ uses)
   - Best for: Identifying topical keywords and technical terms
   - Sensitive to: Terms that are central when they appear

## Combination Methods

### 1. Simple Mean (combined_distinct_mean)
- **Formula**: Average of the three log-ratio scores
- **Best for**: When all three metrics are equally important
- **Advantage**: Simple, interpretable
- **Limitation**: Assumes metrics are on comparable scales

### 2. Standardized Mean (combined_distinct_standardized)
- **Formula**: Average of z-scores for each metric
- **Best for**: When metrics have different variances
- **Advantage**: Ensures each metric contributes equally
- **Limitation**: More abstract scale (in standard deviations)
- **RECOMMENDED for most analyses**

### 3. Minimum Score (combined_distinct_min)
- **Formula**: Minimum of the three scores
- **Best for**: Finding words distinctive on ALL dimensions
- **Advantage**: Conservative, high confidence
- **Limitation**: May miss words strong on just one dimension

### 4. Weighted Combination
- **Formula**: Custom weights (e.g., 0.5*count + 0.3*appear + 0.2*topic)
- **Best for**: When you have theoretical reasons to prioritize metrics
- **Advantage**: Flexible, domain-specific
- **Limitation**: Requires justification for weights

## Choosing the Right Method

### Use standardized mean if:
- You want each metric to contribute equally
- You're exploring the data without strong priors
- You want the most balanced results
- **This is the default recommendation**

### Use simple mean if:
- The three metrics have similar distributions
- You've already checked that scales are comparable
- You prefer simpler, more interpretable scores

### Use minimum score if:
- You want to be very conservative
- You're looking for "slam dunk" distinctive words
- You want words that are distinctive in all ways

### Use weighted combination if:
- You have theoretical reasons (e.g., "count" matters more for your question)
- You're testing specific hypotheses
- You want to emphasize breadth (appear) over intensity (topic)

## Practical Recommendations

1. **Start with standardized mean** - it's the most robust default

2. **Check correlations** between the three metrics:
   - High correlation (>0.8): metrics mostly agree, simple mean is fine
   - Low correlation (<0.5): metrics capture different aspects, standardized is better

3. **Filter by minimum frequency** to avoid rare words with extreme ratios:
   ```r
   filter(count >= 50, appear >= 10)
   ```

4. **Compare results** from different methods:
   - If top 20 words are mostly the same: methods agree, any is fine
   - If top 20 words differ substantially: methods capture different things, 
     choose based on your research question

## Interpreting the Scores

### Log-ratio interpretation (for individual metrics):
- **+2**: Word is 4× more frequent in PS than T20 (or this decade vs others)
- **+1**: Word is 2× more frequent
- **0**: Word has equal frequency
- **-1**: Word is 2× less frequent
- **-2**: Word is 4× less frequent

### Combined distinctiveness:
- Positive scores: more distinctive in PS and/or this decade
- Negative scores: less distinctive in PS and/or this decade
- Magnitude: how much more distinctive (larger = more distinctive)

### Z-scores (standardized):
- **>2**: Highly distinctive (top ~2.5%)
- **>1**: Moderately distinctive (top ~16%)
- **>0**: Above average distinctiveness
- **<0**: Below average distinctiveness

## Example Research Questions → Method Choice

**Q: What philosophical terms became trendy in specific decades?**
→ Use standardized mean, focus on temporal_ratio component

**Q: What makes PS different from other journals generally?**
→ Use standardized mean, focus on spatial_ratio component

**Q: What are the signature keywords of PS in each era?**
→ Use standardized mean with frequency filter (count >= 50)

**Q: Which technical terms are uniquely central to PS?**
→ Use topic_distinct metric specifically, or minimum score

**Q: Which concepts have broadest adoption in PS?**
→ Use appear_distinct metric specifically

## Diagnostic Checks

Run these to validate your approach:

1. Check for NA values: `sum(is.na(combined_distinctiveness$combined_distinct_standardized))`
2. Check distribution: `summary(combined_distinctiveness$combined_distinct_standardized)`
3. Check correlations: `cor(combined_distinctiveness[,c("count_distinct", "appear_distinct", "topic_distinct")])`
4. Check outliers: Look for abs(score) > 5 (very extreme)
5. Spot-check top words: Do they make sense for your domain knowledge?
