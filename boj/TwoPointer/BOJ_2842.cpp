/*
 백준 2842 집배원 한상덕
 21.07.07
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n, h[50][50], cnt_home, startRow, startCol;
char graph[50][50];
bool visited[50][50];
int dx[] = {0, 0, -1, 1, -1, -1, 1, 1};
int dy[] = {-1, 1, 0, 0, -1, 1, 1, -1};
vector<int>height;

// low ~ high 고도내에서 배달 할 수 있는 집의 개수 반환
int bfs(int low, int high) {
    fill(&visited[0][0], &visited[49][50], false);
    int res = 0;
    queue<pii>q;
    if (h[startRow][startCol] < low || h[startRow][startCol] > high) return 0;
    q.push({startRow, startCol});
    visited[startRow][startCol] = true;

    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();

        for (int i = 0; i < 8; ++i) {
            int nr = row + dy[i];
            int nc = col + dx[i];

            if (nr < 0 || nc < 0 || nr >= n || nc >= n) continue;

            if (!visited[nr][nc] && low <= h[nr][nc] && h[nr][nc] <= high) {
                q.push({nr, nc});
                visited[nr][nc] = true;

                if (graph[nr][nc] == 'K') res++;
            }
        }
    }

    return res;
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    // 입력받기
    cin >> n;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> graph[i][j];
            if (graph[i][j] == 'P') {
                startRow = i;
                startCol = j;
            } else if (graph[i][j] == 'K') cnt_home++;
        }
    }

//    int low = INF, high = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> h[i][j];
            height.push_back(h[i][j]);
//            low = min(low, h[i][j]);
//            high = max(high, h[i][j]);
        }
    }

    sort(height.begin(), height.end());


    // 낮은 높이, 높은 높이를 임의로 정해서 모든 집에 배달 할 수 있는지 확인

    // low, high 의 모든 경우를 탐색하면 시간이 오래걸림
    // 1. 이분탐색 사용 : 특정 low에 대해서 가능한 low + 'a' 찾기
    // 2. 투포인터 사용 : 특정 시점에서 low - high가 만족을 했을때 다음 스텝은?

    int ans = height.back() - height[0];
    for (int low = 0, high = 0; low < height.size() && high < height.size(); ) {
        if (low > high) ++high;
        else if (bfs(height[low], height[high]) == cnt_home) {
            ans = min(ans, height[high] - height[low]);
            ++low;
        } else ++high;
    }

    cout << ans << endl;

    return 0;
}
