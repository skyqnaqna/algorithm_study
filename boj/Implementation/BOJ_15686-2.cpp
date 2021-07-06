/*
 백준 15686 치킨배달
 21.07.06
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int graph[50][50];
int n, m;

vector <pii> chickens;
vector <pii> homes;
vector <vector <int> > combinations;
bool visited[13];

int getDistance(int r1, int c1, int r2, int c2) {
    return abs(r1 - r2) + abs(c1 - c2);
}

void getCombinations(int idx, int cnt) {
    if (cnt == m) {
        vector <int> temp;
        for (int i = 0; i < chickens.size(); ++i) {
            if (visited[i]) temp.push_back(i);
        }
        combinations.push_back(temp);
    } else {
        for (int i = idx; i < chickens.size(); ++i) {
            if (!visited[i]) {
                visited[i] = true;
                getCombinations(i, cnt + 1);
                visited[i] = false;
            }
        }
    }
}

int getSolution() {
    int res = INF;

    for (int i = 0; i < combinations.size(); ++i) {
        int chickDist = 0;
        for (int j = 0; j < homes.size(); ++j) {
            int dist = INF;
            for (int k = 0; k < m; ++k) {
                int index = combinations[i][k];
                int temp = getDistance(homes[j].first, homes[j].second, chickens[index].first, chickens[index].second);
                if (temp < dist) dist = temp;
            }
            chickDist += dist;
        }
        if (chickDist < res) res = chickDist;
    }

    return res;
}


int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> graph[i][j];
            if (graph[i][j] == 1) homes.push_back({i, j});
            else if (graph[i][j] == 2) chickens.push_back({i, j});
        }
    }

    getCombinations(0, 0);
    cout << getSolution() << endl;

    return 0;
}