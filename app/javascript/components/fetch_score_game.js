import { fetchWithToken } from "../utils/fetch_with_token";


const createParticipation = (gameId, boardId, score, levelId) => {

  fetchWithToken("/participations", {
    method: "POST",

    body: JSON.stringify({ participation: { game_id: parseInt(gameId), board_id: parseInt(boardId), finished_in: score }, level_id: parseInt(levelId)})
  })
    .then(response => response.json())
    .then((data) => {
      // handle JSON response from server
    });
};

export { createParticipation };
