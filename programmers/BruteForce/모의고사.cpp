// 프로그래머스 모의고사
// 21.02.10
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

typedef long long ll;

using namespace std;

int a[5] = {1,2,3,4,5};
int b[8] = {2,1,2,3,2,4,2,5};
int c[10] = {3,3,1,1,2,2,4,4,5,5};

vector<int> solution(vector<int> answers) 
{
    vector <int> ans;
    vector <int> score(3, 0);
    int len = answers.size();

    for (int i = 0; i < len; ++i)
    {
        if (a[i%5] == answers[i]) ++score[0];
        if (b[i%8] == answers[i]) ++score[1];
        if (c[i%10] == answers[i]) ++score[2];
    }

    int maxScore = *max_element(score.begin(), score.end());
    
    for (int i = 0; i < 3; ++i)
    {
        if (score[i] == maxScore) 
        {
            ans.push_back(i+1);
        }
    }
    
    return ans;
}