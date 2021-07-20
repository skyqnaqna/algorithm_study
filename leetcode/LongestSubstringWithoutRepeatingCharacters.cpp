/*
 LeetCode 3. Longest Substring Without Repeating Characters
 21.07.20
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        int l = 0, r = 0, ans = 0;
        unordered_map<char, int>dic;

        while (r < s.length()) {
            char now = s[r];
            if (dic.count(now) > 0 && l <= dic[now]) {
                l = dic[now] + 1;
            }
            ans = max(ans, r - l + 1);
            dic[now] = r++;
        }

        return ans;
    }
};

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    Solution sol = Solution();
    cout << sol.lengthOfLongestSubstring("dvdf") << endl;

    return 0;
}
