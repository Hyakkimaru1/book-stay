import React from 'react';
import LiReview from './LiReview';

const ListReview = () => {
    return (
        <div>
             <ul className="review">
                <LiReview name="Lê Thị Việt Phương" days="12 days" star="4" img="https://lh3.googleusercontent.com/-V96Xmm9xLBE/AAAAAAAAAAI/AAAAAAAAABo/xwB_4iAqHUc/s96-c/photo.jpg" review="Phòng mới, đẹp và sạch sẽ, còn có khoảng sân xinh xắn để đậu xe. Mình đi chuyến này rất hài lòng với chỗ ở vì đi bộ được ra biển nhưng vẫn yên tĩnh. Các bạn chủ nhà hỗ trợ mình rất nhiệt tình và nhanh chóng, còn chỉ mình rất nhiều chỗ ăn ngon ? Ngoài ra mình khá bất ngờ vì phòng mình ở chỉ là phòng đôi nhưng có đầy đủ bếp, bát đĩa nồi chảo, cực kì tiện nghi."/>
                <LiReview name="Lê Quỳnh Mai" days="2 months" star="5" img="https://cdn.luxstay.com/users_avatar_default/default-avatar.png" review="????"/>
                <LiReview name="Bùi Tuấn" days="5 months" star="5" img="https://cdn.luxstay.com/users/275656/avatar_63591e41-e370-4503-b7cc-8c8f0f783b49.jpg" review="Căn hộ rất đẹp và mới, thuận tiện cho đi lại Bạn chủ nhà rất nhiệt tình và chu đáo Tôi sẽ giới thiệu thêm cho bạn bè nếu có ai muốn du lịch ở Đà Nẵng Cảm ơn Luxstay - Cozy Apartment"/>           
            </ul>
            <p className="detail__head--intro-bt" id="readMore">Xem thêm </p> 
        </div>
    );
}

export default ListReview;
